<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');


            $table->string('email')->unique();
            $table->string('password');


            // Additional plug fields
            $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->string('handle_name')->nullable(); // name to be shown for other user

            $table->string('mobile' , 20)->nullable();

            $table->string('profile_image')->nullable();
            $table->string('cover_image')->nullable();

            //Social Login Details
            $table->string('facebook_id')->nullable();
            $table->string('twitter_id')->nullable();
            $table->string('instagram_id')->nullable();



            $table->boolean('is_active');

            $table->timestamp('deleted_at')->nullable();

            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
