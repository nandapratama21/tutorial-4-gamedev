Nama: Muhammad Nanda Pratama
NPM: 2206081654

## Perbedaan Tilemap
Untuk tilemap, saya menggunakan spritesheet_gr_grass.png pada Level1 dan spritesheet_gr_dirt.png pada level buatan baru saya, yaitu level_x.

## Penjelasan Scene Level_X

Scene Level_X adalah level tambahan yang saya buat dengan menambahkan beberapa fitur di levelnya. Scene ini terdiri dari beberapa komponen utama, di antaranya:

- **Player** - Karakter utama yang dapat dikendalikan oleh pemain. Player ini menggunakan script yang sama seperti pada level lainnya dengan kemampuan bergerak dan melompat.

- **TileMapLayer** - Lapisan peta yang berisi tile-tile platform yang menjadi dasar dari level. TileMapLayer ini menggunakan tileset.tres yang sama dengan Level1 dan diberi skala 0.5x.

- **Area2D** - Area deteksi yang memiliki CollisionShape2D. Area ini digunakan sebagai trigger Win dan Lose.

## Penjelasan Enemy Slime Green

SlimeGreen adalah musuh dalam permainan dengan kemampuan sebagai berikut:
1. **Pergerakan Otomatis**: Slime bergerak horizontal secara otomatis dengan kecepatan tertentu.
2. **Deteksi Tebing**: Menggunakan RayCast (FloorChecker dan FloorChecker2) untuk mendeteksi tepi platform dan berbalik arah ketika mencapai tepi.
3. **Animasi**: Memiliki dua animasi utama:
   - "move": Animasi berjalan normal saat slime bergerak
   - "dead": Animasi saat slime dikalahkan pemain
4. **Interaksi dengan Player**:
   - Jika player menyentuh slime dari samping, player akan kalah dan scene berubah ke LoseScreen
   - Jika player melompat di atas slime (seperti di game Mario), slime akan mati dan menghilang dari scene

## Penjelasan Enemy Frog Lose

FrogLose adalah musuh berbentuk katak yang berjatuhan dari atas dan memiliki karakteristik sebagai berikut:
1. **Physics-Based Movement**: Berbeda dengan SlimeGreen, FrogLose menggunakan RigidBody2D sehingga pergerakannya dipengaruhi oleh fisika.
2. **Contact Detection**: Menggunakan sistem contact monitoring untuk mendeteksi tabrakan dengan objek lain.
3. **Player Interaction**: Ketika menyentuh player, langsung mengubah scene ke LoseScreen.
4. **Clean-up System**: Ketika menyentuh TileMapLayer (platform/tanah), FrogLose secara otomatis menghapus dirinya sendiri dari scene menggunakan queue.free().

Untuk background, saya menggunakan TextureRect dengan texture dari koleksi kenney_platformerpack. Background ini menggunakan file gambar dari direktori `assets/kenney_platformerpack/PNG/Backgrounds/blue_desert.png`  yang memberikan tampilan background level. TextureRect diposisikan di belakang semua elemen gameplay dan di-stretch untuk menutupi seluruh area permainan, menciptakan atmosfer yang sesuai dengan tema platformer. Background ini mengikuti player karena dijadikan sebagai child dari player.


## Tantangan dan Pembelajaran
Selama pembuatan level_x ini, tantangan yang dihadapi antara lain:
- Mengimplementasikan deteksi tebing (cliff) yang konsisten untuk SlimeGreen, bagian ini saya bahkan sampai melakukan banyak debugging
