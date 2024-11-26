<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // Instructor ID
            $table->foreignId('category_id')->constrained()->onDelete('cascade'); // Course category
            $table->foreignId('sub_category_id')->constrained()->onDelete('cascade'); // Course sub category
            $table->foreignId('thumbnail_id')->nullable(); // Thumbnail id
            $table->string('title', 255);
            $table->text('description')->nullable(); // Changed from details to description
            $table->decimal('price', 8, 2)->default(0.00);
            $table->integer('sits'); // Available sits
            $table->date('start_date'); // Start date
            $table->date('end_date'); // End date
            $table->tinyInteger('status')->default(2); // 0 => inactive, 1 => active, 2 => pending
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
        Schema::dropIfExists('courses');
    }
};
