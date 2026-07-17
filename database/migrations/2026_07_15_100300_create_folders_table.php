<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('folders', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('parent_id')->nullable()->constrained('folders')->cascadeOnDelete();

            $table->string('name');
            $table->string('drive_folder_id')->nullable();   // Google Drive folder ID
            $table->boolean('synced')->default(false);         // uploaded to Drive?

            $table->timestamps();

            $table->index(['user_id', 'parent_id']);
        });

        Schema::create('files', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('folder_id')->nullable()->constrained('folders')->cascadeOnDelete(); // null = root

            $table->string('name');
            $table->string('disk_path');                       // local storage path (disk: local)
            $table->string('mime')->nullable();
            $table->unsignedBigInteger('size')->default(0);
            $table->string('drive_file_id')->nullable();       // Google Drive file ID
            $table->string('drive_link')->nullable();          // Drive webViewLink
            $table->boolean('synced')->default(false);

            $table->timestamps();

            $table->index(['user_id', 'folder_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('files');
        Schema::dropIfExists('folders');
    }
};
