# yuritopia
Kindred Spirits on the Roof porting kit for Nintendo Switch

# Dependency

Ofc, this script requires you have legit copy of Kindred Spirits on the Roof.
You can purchase the game from one of links below:

* http://www.dlsite.com/pro/work/=/product_id/VJ011691.html
* http://www.net-ride.com/shopping/index.php?R_km_url=liarso&dw_week=20161028183602
* http://gyutto.com/i/item202717?select_uaflag=1
* http://dlsoft.dmm.co.jp/detail/bpartner_0043/?dmmref=kw09qj1g&i3_ord=2&i3_ref=recommend
* https://www.mangagamer.com/r18/detail.php?goods_type=1&product_code=1093

This script assumes following commands are available and accessible through $PATH.

* https://github.com/sharkdp/fd
* https://github.com/Lattyware/unrpa
* https://github.com/Shizmob/rpatool
* ffmpeg
* cwebp
* 7z
* nacptool (https://github.com/switchbrew/switch-tools)
* elf2nro (https://github.com/switchbrew/switch-tools)

This script will automatically download and prepare following projects
* https://github.com/uyjulian/renpy-switch

# Instruction

1. Install all the dependencies.
2. Extract game zip in this directory. It should create directory named `kindredspirits-fc-pc`.
3. If you want any game mod to be included, install it in game directory.
4. Run `runme.sh`. It will transcode all assets and build `yuritopia.nro`.

# Special thanks

@uyjulian for porting Ren'Py to Nintendo Switch

# Note

Game logo is obtained from https://upload.wikimedia.org/wikipedia/en/e/e1/Kindred_Spirits_on_the_Roof_Logo.png

My setup requires approx 2min to boot up the game (Korean locale mod installed, full chorus edition). I guess overclocking with sys-clk can reduce startup time but I didn't tried it yet. Your mileage may vary.
