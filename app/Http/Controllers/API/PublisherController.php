<?php

namespace App\Http\Controllers\API;

use App\Models\Store;
use function foo\func;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use URL;
use Image;
use Validator;
use App\Models\Publisher as User;
use App\Models\Publishing;
use App\Models\Block;
use App\Models\Follower;
use App\Models\Favourit;
use App\Models\LogActivity;
use File;
use Illuminate\Support\Str;
use App\Notifications\Follow as FollowNotify;
use App\Models\Comment;
use App\Models\Provider;
use App\Models\Like;
use App\Models\CommentSuggest;
use App\Models\LikeSuggest;
use App\Models\Suggest;

class PublisherController extends Controller
{
     use ApiResponseTrait;
    /**********************
     *     helper
     * ********************
     * */

    /*
     * @optional take add flage to return valdation for add or edit
     * @return arry of valdation
     * */
    //activity response
    protected function reponseActivity($activity)
    {
        $res['id'] = $activity->id;
        if ($activity->status == "publsihing") {
            $publising = Publishing::where('id', $activity->action_id)->first();
            if ($publising) {
                if ($publising->sharer_id)
                    $res['publisher'] = $this->responsePublisherUser($publising->sharer);
                else
                    $res['publisher'] = $this->responsePublisherUser($publising->publisher);
                $res['delte'] = false;
            } else {
                $res['publisher'] = $this->responsePublisherUser($activity->publisher);
                $res['delte'] = true;
            }
        } elseif ($activity['status'] == "publisher") {
            $publiser = User::where('id', $activity->action_id)->first();
            if ($publiser) {
                $res['publisher'] = $this->responsePublisherUser($publiser);
                $res['delte'] = false;
            } else {
                $res['publisher'] = $this->responsePublisherUser($activity->publisher);
                $res['delte'] = true;
            }
        } else {
            $publising = Suggest::where('id', $activity->action_id)->first();
            if ($publising) {

                $res['publisher'] = $this->responsePublisherUser($publising->publisher);
                $res['delte'] = false;
            } else {
                $res['publisher'] = $this->responsePublisherUser($activity->publisher);
                $res['delte'] = true;
            }
        }
        $res['type'] = $activity->type;
        $res['status'] = $activity->status;
        $res['action_id'] = $activity->action_id;
        return $res;
    }

    protected function responsePublisherUser($user)
    {
        $res["id"] = $user->id;
        $res["username"] = $user->username;
        $res["display_name"] = $user->display_name;
        $res["verified"] = $user->verified;
        $res["is_verified"] = $user->is_verified == '1' ? true : false;
        $res["status"] = $user->status;
        $image = is_null($user['image']) ? "default_image.png" : $user['image'];
        $res['image'] = asset('uploads/publishers') . '/' . $image;
        $res['type'] = 1;
        return $res;
    }

    //response user
    protected function responseUser($user)
    {
        $res["id"] = $user->id;
        $res["username"] = $user->username;
        $res["display_name"] = $user->display_name;
        $res["mobile"] = $user->mobile;
        $res["email"] = $user->email;
        $res["city"] = $user->city;
        $res['bio'] = is_null($user['bio']) ? "" : $user['bio'];
        $image = is_null($user['image']) ? "default_image.png" : $user['image'];
        $res['image'] = asset('uploads/publishers') . '/' . $image;
        $res['status'] = is_null($user['status']) ? 1 : $user['status'];
        $res['verified'] = is_null($user['verified']) ? 1 : $user['verified'];
        $res['follow'] = $user->follows()->count();
        $res['follower'] = $user->followers()->count();
        $res['type'] = 1;
        $res['notification_count'] = $user->unreadNotifications()->count();
        $res["is_verified"] = $user->is_verified  == '1' ? true : false;
        $res['accountPrivacy'] = $user->accountPrivacy == '1' ? true : false;
        $res['phonePrivacy'] = $user->phonePrivacy == '1' ? true : false;
        $res['emailPrivacy'] = $user->emailPrivacy == '1' ? true : false;
        $res['followPrivacy'] = $user->followPrivacy == '1' ? true : false;
        return $res;
    }

    //response block
    protected function responseBlock($block)
    {
        $res['publisher'] = $this->responsePublisherUser($block->publisher);
        return $res;

    }

    // reposne notifcation
    protected function responseNotification($notify)
    {
        $res['id'] = $notify['id'];
        $res['image'] = $notify->data['image'];
        $res['pid'] = $notify->data['pid'];
        $res['type'] = $notify->data['type'];
        $res['title_ar'] = $notify->data['title_ar'];
        $res['title_en'] = $notify->data['title_en'];
        $res['msg_ar'] = $notify->data['msg_ar'];
        $res['msg_en'] = $notify->data['msg_en'];
        $res['created_at'] = strtotime($notify->created_at) * 1000;
        $res['readed_at'] = is_null($notify->read_at) ? "" : $notify->read_at->format('d-m-Y h:i a');
        return $res;
    }

    protected function responseStore($user, $type=2)
    {
        $res["id"]              = $user->id;
        $res["store_name"]      = $user->store_name;
        $res["mobile"]          = $user->mobile;
        $res["email"]           = $user->email;
        $res["city"]            = $user->city;
        $image                  = is_null($user['image'])? "default_image.png" : $user['image'];
        $res['image']           = asset('uploads/publishers') . '/' . $image;
        $res['status']          = is_null($user['status'])?1:$user['status'];
        $res['verified']        = is_null($user['verified'])?1:$user['verified'];
        $res['type']            = $type;
        $res['storeType']       = $this->responseStoreType($user->StoreType);
        $res['notification_count']= $user->unreadNotifications()->count();
        return $res;
    }


    // save logs
    public  function save_log($publisher_id, $action_id, $type, $status)
    {
        $log = new LogActivity;
        $log->publisher_id = $publisher_id;
        $log->action_id = $action_id;
        $log->type = $type;
        $log->status = $status;

        $log->save();
    }
    /*===========================*/

    // sign in
    public function signIn(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "username" => 'required|string|alpha_dash|min:2|max:190|unique:publishers,username',
            'display_name' => 'required|min:2|max:190',
            'image' => 'nullable|image',
            'mobile' => 'required|min:2|max:190|unique:publishers,mobile',
            'email' => 'required|email|min:2|max:190|unique:publishers,email',
            'city' => 'required|min:2|max:190',
            'password' => 'required|min:6|max:190',
            'bio' => 'nullable',
            'device_id' => 'required',
            'device_type' => 'required|in:ios,android'
        ]);
        if ($validator->passes()) {

            $user = new User;
            $user->username = $request['username'];
            $user->display_name = $request['display_name'];
            $user->mobile = $request['mobile'];
            $user->bio = $request['bio'];
            $user->email = convert2english($request['email']);
            $user->password = bcrypt(convert2english($request['password']));
            $user->activation_temp = randomString(6, 'num');
            $user->city = $request['city'];
            $user->device_id = $request['device_id'];
            $user->device_type = $request['device_type'];
            $user->save();
            \Mail::to($user)->send(new  \App\Mail\ActivationNewUserMail($user->username, $user->activation_temp));
            return response()->json(
                [

                    'status' => true,
                    'data' => ['publisher' => $this->responseUser($user)],
                    'msg' => ""
                ]
            );
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // login
    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            // 'email' => 'required|email|min:2|max:190',
            'identify' => 'required',
            'password' => 'required|min:6|max:190',
            'device_id' => 'required',
            'device_type' => 'required|in:ios,android'
        ]);

        if ($validator->passes()) {
            $value = request()->input('identify');
            $filed = $this->filterIdentifyLogin($value);
            request()->merge([ $filed => $value ]);


            if (!auth('publisher')->attempt([$filed => convert2english($value), 'password' => convert2english($request['password'])])) {
                $msg = $request['lang'] == 'ar' ? ' كلمه المرور او الاميل غير صحيح.' : ' password or '.$filed.' is wrong.';
                return response()->json(['status' => false, 'msg' => $msg]);
            }
            $user = auth('publisher')->user();

            $user->device_id = $request['device_id'];
            $user->device_type = $request['device_type'];
            $user->save();


            if ($user->status == 0) {
                $msg = $request['lang'] == 'ar' ? 'المستخدم محظور حاليا يمكن التواصل مع الاداره.' : ' user has been blocked can contact with adminstration.';
                return response()->json(['status' => false, 'msg' => $msg]);
            }

            return response()->json(
                [

                    'status' => true,
                    'data' => ['publisher' => $this->responseUser($user)],
                    'msg' => ""
                ]
            );


        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

      // login


    public function filterIdentifyLogin($identify) {

        if (filter_var($identify, FILTER_VALIDATE_EMAIL)) {
              return 'email';
            } elseif (preg_match("/^[0-9]+$/i", $identify)) {
              return 'mobile';
            } else {
               return 'username'; 
            }

    }// end filterIdentifyLogin

    public function socialLogin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|min:2|max:190',
            'provider' => 'required|string',
            'provider_id' => 'required|min:6|max:190',
            'device_id' => 'required',
            'device_type' => 'required|in:ios,android'

        ]);



        if ($validator->passes()) {

            $selectProvider = Provider::where('provider_id',$request->provider_id)->first();

            if(!$selectProvider) {
                $getRealPublisher = User::where('email',$request->email)->first();

                if(!$getRealPublisher) {
                    $getRealPublisher = new User();
                    $getRealPublisher->display_name = $request->name;
                    $getRealPublisher->email = $request->email;
                    $getRealPublisher->device_id = $request->device_id;
                    $getRealPublisher->device_type = $request->device_type;
                    $getRealPublisher->username = generate_unique_username($request->name);
                    $getRealPublisher->password = bcrypt(randomString(8, 'num'));
                    $getRealPublisher->is_verified = 1;
                    $getRealPublisher->save();
                }

                 $newProvider = new Provider();

                 $newProvider->provider_id =  $request->provider_id;
                 $newProvider->provider =  $request->provider;
                 $newProvider->publisher_id =  $getRealPublisher->id;
                 $newProvider->save();


            } else {
                $getRealPublisher = User::find($selectProvider->publisher_id);

            }

              auth('publisher')->login($getRealPublisher);

                return response()->json(
                [

                    'status' => true,
                    'data' => ['publisher' => $this->responseUser($getRealPublisher)],
                    'msg' => ""
                ]
            );



        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    } // END SOCIAL LOGIN

    // get user profile
    public function getUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:publishers,id',
        ]);
        if ($validator->passes()) {
            $user = User::find($request['user_id']);
            return response()->json(
                [

                    'status' => true,
                    'data' => ['publisher' => $this->responseUser($user)],
                    'msg' => ""
                ]
            );


        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // get user notifcation
    public function getNotifications(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:publishers,id',
        ]);
        if ($validator->passes()) {
            $user = User::find($request['user_id']);
            $notifications = $user->notifications()->latest()->paginate(30);
            $user->unreadNotifications->markAsRead();
            $meta = getBasicInfoPagantion($notifications);
            $data = getCollectionPagantion($notifications)->map(function ($notify) use ($request) {
                return $this->responseNotification($notify);
            });
            return response()->json(
                [

                    'status' => true,
                    'data' => ['notifications' => $data],
                    'msg' => "",
                    'meta' => $meta
                ]
            );


        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // delte notification
    public function deleteNotifications(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'notification_id' => 'required|exists:notifications,id',
        ]);
        if ($validator->passes()) {
            \DB::delete("delete from notifications where id= ?", [$request['notification_id']]);
            $msg = $request["lang"] == "ar" ? " تم الحذف" : "Sucessful delete";
            return response()->json(['key' => 'success', 'value' => '1', "msg" => $msg,]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['key' => 'fail', 'value' => '0', 'msg' => $msg[0]]);
                }
            }
        }


    }

    // update profile
    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:publishers,id',
            "username" => 'required|min:2|max:190',
            'display_name' => 'required|min:2|max:190',
            'image' => 'nullable|image',
            'mobile' => 'required|min:2|max:190|unique:publishers,mobile,' . $request['user_id'],
            'email' => 'required|email|min:2|max:190|unique:publishers,email,' . $request['user_id'],
            'city' => 'required|min:2|max:190',
            'bio' => 'nullable',
        ]);

        if ($validator->passes()) {

            $user = User::find($request['user_id']);
            $user->username = $request['username'];
            $user->display_name = $request['display_name'];
            $user->mobile = $request['mobile'];
            $user->bio = $request['bio'];
            $user->email = convert2english($request['email']);
            $user->city = $request['city'];

            if ($request['image']) {
                $photo = $request->image;
                if ($user->image != 'default_image.png') {
                    File::delete('uploads/publishers/' . $user->image);
                }

                $name = date('d-m-y') . time() . rand() . '.' . $photo->getClientOriginalExtension();
//                Image::make($photo)->save('uploads/publishers/' . $name);
                $photo->move(public_path('uploads/publishers'), $name);
                $user->image = $name;

            }
            $user->save();
            $msg = $request['lang'] == 'ar' ? 'تم تعديل الحساب' : 'account update .';
            return response()->json(
                ['status' => true, 'data' => ['trip' => ['id' => null]], 'msg' => $msg]
            );


        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }

    }


    // update profile
    public function updateToken(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:publishers,id',
            'device_id' => 'required',
            'device_type' => 'required',
        ]);

        if ($validator->passes()) {

            $user = User::find($request['user_id']);
            $user->device_id = $request['device_id'];
            $user->device_type = $request['device_type'];

            $user->save();
            $msg = $request['lang'] == 'ar' ? 'تم تعديل الحساب' : 'account update .';
            return response()->json(
                ['status' => true, 'msg' => $msg]
            );


        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }

    }


    //change user password
    public function changePassword(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:publishers,id',
            'password' => 'required|min:6|max:190',
            'old_password' => 'required|min:6|max:190',

        ]);

        if ($validator->passes()) {
            $request["password"] = convert2english($request["password"]);
            $request["old_password"] = convert2english($request["old_password"]);
            $user = User::find($request['user_id']);
            if (\Hash::check($request['old_password'], $user->password)) {
                $user['password'] = bcrypt($request['password']);
                $user->save();
                $arr['id'] = $user['id'];
                $msg = $request['lang'] == 'ar' ? 'تم تغير كلمة السر بنجاح ' : " password change successfull";
                return response()->json(['status' => true, 'data' => ['password' => ['id' => null]], 'msg' => $msg]);
            } else {
                $msg = $request['lang'] == 'ar' ? 'رقم السرى القديم غير صحيح ' : "old password not correct";
                return response()->json(['status' => false, 'msg' => $msg]);
            }
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }

    }

    // chnage langue
    public function changeLang(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
            'lang' => "required|in:ar,en"
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request["user_id"]);
            $user["lang"] = $lang;
            $user->update();
            $msg = $lang == "ar" ? "تم تغير اللغه بنجاح" : "sucessfull change the langue";
            return response()->json(['status' => true, 'data' => ['lang' => ['id' => null]], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // chnage langue
    public function randomUsers(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request["user_id"]);
            $blocks = Block::buldBlockId($request['user_id']);
            $blockingMe = Block::buldBlockerId($request['user_id']);
            $follow = $user->followers()->pluck('follow_id')->toArray();
            $all = array_merge($blockingMe, $blocks, $follow, array($user->id));
            $users = User::whereNotIn('id', $all)->inRandomOrder()->where('status', 1)->limit(10)->get();
            $data = $users->map(function ($user) {
                return $this->responsePublisherUser($user);
            });

            return response()->json(
                [
                    'status' => true,
                    'data' => ["suggested_users" => $data],
                    'msg' => ""
                ]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // chnage langue
    public function logActivity(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request["user_id"]);
            $data = $user->logs->map(function ($log) {
                return $this->reponseActivity($log);
            });
            return response()->json(['status' => true, 'data' => ["activites" => $data], 'msg' => ""]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // delete all logs
    public function deleteLogActivity(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request["user_id"]);
            $user->logs()->delete();
            $msg = $lang == "ar" ? "تم الحذف بنجاح" : "sucessfull delete the date";
            return response()->json(['status' => true, 'data' => ["activites" => ""], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // block action
    public function blockAction(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
            'publisher_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            if ($request['user_id'] == $request['publisher_id']) {
                $msg = $lang == "ar" ? "لايمكن حظر نفسك" : "can\'t block your self";
                return response()->json(['status' => false, 'data' => ["blocks" => ""], 'msg' => $msg]);
            }
            $block = Block::where('user_id', $request['user_id'])
                ->where('publisher_id', $request['publisher_id'])->first();


            if ($block) {
                $block->delete();
                $msg = $lang == "ar" ? "تم حذف الحظر بنجاح" : "sucessfull delete blocked";


                $this->save_log(
                    $request['user_id'],
                    $request['publisher_id'],
                    'UNBLOCK',
                    'publisher'
                );




            } else {
                $block = new Block;
                $block->user_id = $request['user_id'];
                $block->publisher_id = $request['publisher_id'];
                $block->save();

                // delete favourit
                Favourit::whereIn("user_id", [$request['user_id'], $request['publisher_id']])
                    ->whereHas('publishing', function ($q) use ($request) {
                        $q->whereIn('publisher_id', [$request['user_id'], $request['publisher_id']])
                            ->orWhereIn('sharer_id', [$request['sharer_id'], $request['publisher_id']]);
                    })->delete();

                // delte follower for us
                Follower::where(function ($query) use ($request) {
                    $query->where('follow_id', $request['user_id'])
                        ->where('follower_id', $request['publisher_id']);
                })->orWhere(function ($query) use ($request) {
                    $query->where('follow_id', $request['publisher_id'])
                        ->where('follower_id', $request['user_id']);
                })->delete();

        /*        // remove share to other
                Publishing::where(function ($query) use ($request) {
                    $query->where('publisher_id', $request['user_id'])
                        ->where('sharer_id', $request['publisher_id']);
                })->orWhere(function ($query) use ($request) {
                    $query->where('publisher_id', $request['publisher_id'])
                        ->where('sharer_id', $request['user_id']);
                })->delete();*/
                /*---- publishing ---- */
                // reomve like
          /*      // reomver like user
                Like::where("user_id", $request['user_id'])
                    ->whereHas('publishing', function ($q) use ($request) {
                        $q->where('publisher_id', $request['publisher_id'])
                            ->orWhere('sharer_id', $request['publisher_id']);
                    })->delete();

                // reomver like publisher
                Like::where("user_id", $request['publisher_id'])
                    ->whereHas('publishing', function ($q) use ($request) {
                        $q->where('publisher_id', $request['user_id'])
                            ->orWhere('sharer_id', $request['user_id']);
                    })->delete();*/

                // reomve comment
                // reomver comment user
              /*  Comment::where("user_id", $request['user_id'])
                    ->whereHas('publishing', function ($q) use ($request) {
                        $q->where('publisher_id', $request['publisher_id'])
                            ->orWhere('sharer_id', $request['publisher_id']);
                    })->delete();

                // reomver comment publisher
                Comment::where("user_id", $request['publisher_id'])
                    ->whereHas('publishing', function ($q) use ($request) {
                        $q->where('publisher_id', $request['user_id'])
                            ->orWhere('sharer_id', $request['user_id']);
                    })->delete();

                /*----- suggest ---
                // remove user like to publiser
                LikeSuggest::where("user_id", $request['user_id'])
                    ->whereHas('suggest', function ($q) use ($request) {
                        $q->where('user_id', $request['publisher_id']);
                    })->delete();

                // reomver publisher like to user
                LikeSuggest::where("user_id", $request['publisher_id'])
                    ->whereHas('suggest', function ($q) use ($request) {
                        $q->where('user_id', $request['user_id']);
                    })->delete();

                // reomve comment user to publisher
                CommentSuggest::where("user_id", $request['user_id'])
                    ->whereHas('suggest', function ($q) use ($request) {
                        $q->where('user_id', $request['publisher_id']);
                    })->delete();

                // reomver publisher like to user
                CommentSuggest::where("user_id", $request['publisher_id'])
                    ->whereHas('suggest', function ($q) use ($request) {
                        $q->where('user_id', $request['user_id']);
                    })->delete();*/


                $msg = $lang == "ar" ? "تم  الحظر بنجاح" : "sucessfull blocked";
                $this->save_log(
                    $request['user_id'],
                    $request['publisher_id'],
                    'BLOCK',
                    'publisher'
                );

            }

            return response()->json(['status' => true, 'data' =>  ['trip' => ['id' => null]], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // block-list
    public function block_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request['user_id']);
            $data = $user->blockers->map(function ($blocker) {
                return $this->responsePublisherUser($blocker->publisher);
            });
            return response()->json([
                'status' => true,
                'data' => ["blocks" => $data],
                'msg' => ""]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // follow action
    public function followAction(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
            'publisher_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            if ($request['user_id'] == $request['publisher_id']) {
                $msg = $lang == "ar" ? "لايمكن تبع نفسك" : "can\'t follow your self";
                return response()->json(['status' => false, 'data' => ["blocks" => ""], 'msg' => $msg]);
            }
            $follow = Follower::where('follower_id', $request['user_id'])
                ->where('follow_id', $request['publisher_id'])->first();
            if ($follow) {
                $follow->delete();
                $msg = $lang == "ar" ? "تم حذف التتبع بنجاح" : "sucessfull delete follow";

                $this->save_log(
                    $request['user_id'],
                    $request['publisher_id'],
                    'UNFOLLOW',
                    'publisher'
                );


            } else {
                $follow = new Follower;
                $follow->follower_id = $request['user_id'];
                $follow->follow_id = $request['publisher_id'];
                $follow->save();
                $msg = $lang == "ar" ? "تم  التتبع بنجاح" : "sucessfull follow";
                $followUser = User::find($request['publisher_id']);
                $followerUser = User::find($request['user_id']);
                $followUser->notify(new FollowNotify($followUser, $followerUser));


                $this->save_log(
                    $request['user_id'],
                    $request['publisher_id'],
                    'FOLLOW',
                    'publisher'
                );


            }

            return response()->json(['status' => true, 'data' => ["trip" => ['id' => null]], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // log
    // follow action
    public function logger(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
            'type' => 'required',
            'action_id' => 'required',
            'status' => 'required|in:publsihing,publisher,suggest'
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $event = new \App\Models\LogActivity;
            $event->publisher_id = $request['user_id'];
            $event->type = $request['type'];
            $event->action_id = $request['action_id'];
            $event->status = $request['status'];
            if ($request['status'] == "publsihing") {
                $check = Publishing::where('id', '=', $request['action_id'])->first();
                if ($check == null) {
                    $msg = $lang == "ar" ? "المنشور غير موجد " : "post not found";
                    return response()->json([
                        'status' => false,
                        'data' => ["trip" => ['id' => null]],
                        'msg' => $msg]);
                }
            } elseif ($request['status'] == "publisher") {
                $check = User::where('id', '=', $request['action_id'])->first();
                if ($check == null) {
                    $msg = $lang == "ar" ? "المستخدك غير موجد " : "user not found";
                    return response()->json(['status' => false, 'data' => ["trip" => ['id' => null]], 'msg' => $msg]);
                }
            } else {
                $check = Suggest::where('id', '=', $request['action_id'])->first();
                if ($check == null) {
                    $msg = $lang == "ar" ? "الاقتراح غير موجد " : "suggest not found";
                    return response()->json(['status' => false, 'data' => ["trip" => ['id' => null]], 'msg' => $msg]);
                }

            }
            $event->save();
            $msg = $lang == "ar" ? "تم التخزين" : "store done";
            return response()->json(['status' => true, 'data' => ["trip" => ['id' => null]], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // follow-list
    public function follow_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request['user_id']);
            $data = $user->follows->map(function ($blocker) {
                $user = User::find($blocker->follower_id);

                return $this->responsePublisherUser($user);
            });
            return response()->json(['status' => true, 'data' => ["follows" => $data], 'msg' => ""]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // follower-list
    public function follower_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request['user_id']);

            $data = $user->followers->map(function ($blocker) {
                $user = User::find($blocker->follow_id);
                return $this->responsePublisherUser($user);
            });
            return response()->json
            ([
                'status' => true,
                'data' => ["followers" => $data],
                'msg' => ""
            ]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // search
    public function searchPublisher(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'search' => "required",
        ]);
        if ($validator->passes()) {
            $lang = $request['lang'];
            $blocks = Block::buldBlockId($request['user_id']);
            $blockingMe = Block::buldBlockerId($request['user_id']);
            $allBlocks = array_merge($blocks, $blockingMe);
            $publishrs = User::whereNotIn('id', $allBlocks)
                ->where('username', 'LIKE', '%' . $request['search'] . '%')
                ->orWhere('display_name', 'LIKE', '%' . $request['search'] . '%')->get();
            $data = $publishrs->map(function ($publisher) {
                return $this->responsePublisherUser($publisher);
            });
            return response()->json(['status' => true, 'data' => ["publishers" => $data], 'msg' => ""]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // logout
    public function logout(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required|exists:publishers,id",
        ]);

        if ($validator->passes()) {
            $lang = $request['lang'];
            $user = User::find($request['user_id']);
            $user->device_id = null;
            $user->device_type = null;
            $user->update();
            $msg = $lang == "ar" ? "تم تسجيل الخروج" : "sucessfull logout";
            return response()->json(['status' => true, 'data' => ["publisher" => ""], 'msg' => $msg]);
        } else {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return response()->json(['status' => false, 'msg' => $msg[0]]);
                }
            }
        }
    }

    // reset mail
    public function restPasswordMail(Request $request)
    {

            $validator = Validator::make($request->all(), [
                // 'email' => "required|email|exists:publishers,email",
                'identify' => "required",
            ]);

            if ($validator->passes()) {
                $value = request()->input('identify');
                $filed = $this->filterIdentifyLogin($value);
                request()->merge([ $filed => $value ]);
                $lang = $request['lang'];
                $user = User::where($filed, $value)->first();
                $user->temporay_password = randomString(6, 'num');
                $user->update();
                \Mail::to($user)->send(new  \App\Mail\ResetPassword($user->username, $user->temporay_password));
                $msg = $lang == "ar" ? "تم ارسال الميل " : "sucessfull send mail ";
                return response()->json(['status' => true, 'data' => ["password" => ['temp' => $user->temporay_password]], 'msg' => $msg]);
            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }


    } // end restPasswordMail


     public function sendActivationMail(Request $request)
    {

            $validator = Validator::make($request->all(), [
                'email' => "required|email|exists:publishers,email",
            ]);

            if ($validator->passes()) {
                $lang = $request['lang'];
                $user = User::where('email', $request['email'])->first();
                $user->activation_temp = randomString(6, 'num');
                $user->update();
                \Mail::to($user)->send(new  \App\Mail\ActivationNewUserMail($user->username, $user->activation_temp));
                $msg = $lang == "ar" ? "تم ارسال الميل " : "sucessfull send mail ";
                return response()->json(['status' => true, 'data' => ['temp' => $user->activation_temp], 'msg' => $msg]);
            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }


    }

    // check code whic send
    public function checkActivationTemp(Request $request)
    {


            $validator = Validator::make($request->all(), [
                'email' => "required|email|exists:publishers,email",
                'temp' => "required"
            ]);

            if ($validator->passes()) {
                $lang = $request['lang'];
                $user = User::where('email', $request['email'])->first();
                if ($user->activation_temp != $request['temp']) {
                    $msg = $lang == "ar" ? "كود الدخول الموقت غير صحيح" : "temporary code for login not success";
                    return response()->json(['status' => false, 'data' => ["publisher" => ['temp' => ""]], 'msg' => $msg]);
                }
                 $user->is_verified = 1;
                 if( $user->update() ) {

                $msg = $lang == "ar" ? "تم التحقق من المستخدم" : "successfully verifed user";
                return response()->json(['status' => true, 'data' => ["publisher" => $this->responseUser($user)], 'msg' => $msg]);
                 }

            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }


    }




    // check code whic send
    public function checkTemploaryPassword(Request $request)
    {


            $validator = Validator::make($request->all(), [
                // 'email' => "required|email|exists:publishers,email",
                'identify' => "required",
                'temp_password' => "required"
            ]);

            if ($validator->passes()) {
                $value = request()->input('identify');
                $filed = $this->filterIdentifyLogin($value);
                request()->merge([ $filed => $value ]);
                $lang = $request['lang'];
                $user = User::where($filed, $value)->first();

                if ($user->temporay_password != $request['temp_password']) {
                    $msg = $lang == "ar" ? "كود الدخول الموقت غير صحيح" : "temporary code for login not success";
                    return response()->json(['status' => false, 'data' => ["publisher" => ['temp' => ""]], 'msg' => $msg]);
                }

                $msg = $lang == "ar" ? "تم التاكد يرجع تغير الرقم السرى" : "successfully verifed user pleaze change passowrd";
                return response()->json(['status' => true, 'data' => ["publisher" => $this->responsePublisherUser($user)], 'msg' => $msg]);
            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }


    }

    // reset-password
    public function resetPassword(Request $request)
    {



        if(isset($request->store))
        {
            $validator = Validator::make($request->all(), [
                'user_id' => "required|exists:stores,id",
                'password' => "required|min:6|max:190"
            ]);

            if ($validator->passes()) {
                $lang = $request['lang'];
                $store = Store::find($request['user_id']);
                if (is_null($store->temporay_password)) {
                    $msg = $lang == "ar" ? "كود الدخول لم يتم ارساله" : "tempory code not send";
                    return response()->json(['status' => false, 'msg' => $msg]);
                }
                $store->password = bcrypt(convert2english($request['password']));
                $store->temporay_password = null;
                $store->update();

                $msg = $lang == "ar" ? "تم تغير كلمة المرور" : "change the password sucessfull";
                return response()->json(['status' => true , 'msg' => $msg]);
            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }
        }
        else {
            $validator = Validator::make($request->all(), [
                'user_id' => "required|exists:publishers,id",
                'password' => "required|min:6|max:190"
            ]);

            if ($validator->passes()) {
                $lang = $request['lang'];
                $user = User::find($request['user_id']);
                if (is_null($user->temporay_password)) {
                    $msg = $lang == "ar" ? "كود الدخول لم يتم ارساله" : "tempory code not send";
                    return response()->json(['status' => false, 'data' => ["password" => ['temp' => null]], 'msg' => $msg]);
                }
                $user->password = bcrypt(convert2english($request['password']));
                $user->temporay_password = null;
                $user->update();
                publisher_log(
                    $request['user_id'],
                    ' لقد قمت تغير كلمة المرور  ',
                    'you change the password'
                );
                $msg = $lang == "ar" ? "تم تغير كلمة المرور" : "change the password sucessfull";
                return response()->json(['status' => true, 'data' => ["password" => ['id' => null]], 'msg' => $msg]);
            } else {
                foreach ((array)$validator->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        return response()->json(['status' => false, 'msg' => $msg[0]]);
                    }
                }
            }
        }


    }



    public function privacy(Request $request)
    {

        $validation=Validator::make(
            $request->all(),
            [

                'user_id'     =>'required|numeric',
                'accountPrivacy'   =>'nullable|in:0,1',
                'phonePrivacy'   =>'nullable|in:0,1',
                'emailPrivacy'   =>'nullable|in:0,1',
                'followPrivacy'   =>'nullable|in:0,1'
             ]
            );

        if ($validation->fails()) {
            // $this->_result->FaildReason =  $validation->errors()->first();
               foreach ((array)$validation->errors() as $key => $value) {
                    foreach ($value as $msg) {
                        // return response()->json(['status' => false, 'msg' => $msg[0]]);
                         return $this->apiResponse(null, $msg[0] , 200);
                    }
                }

        }


         $user = User::find($request['user_id']);

         if($request->has('accountPrivacy')) {
            $user->accountPrivacy = (int) $request['accountPrivacy'] ;

         }
         if($request->has('phonePrivacy')){

            $user->phonePrivacy =(int) $request['phonePrivacy']  ;
         }
         if($request->has('emailPrivacy')){
            $user->emailPrivacy =(int) $request['emailPrivacy'] ;
         }
         if($request->has('followPrivacy')){
            $user->followPrivacy =(int) $request['followPrivacy'] ;
         }


         if($user->update()){

            $lang = $request['lang'];
            $msg = $lang == "ar" ? "تم التعديل بنجاح" : " Updated sucessfully";

             return $this->apiResponse(null, $msg , 200);
         }



    }

    public function test()
    {
        echo "hi";
    }

}
