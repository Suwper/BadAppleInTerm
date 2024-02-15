

read -p "Are you sure you want to continue? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
	{	
	mkdir temp

	cd temp/

	git clone https://github.com/adriabama06/image-to-ascii.git


	cd image-to-ascii/

	mkdir build

	cd build/

	cmake .. && cmake --build .


	mv image-to-ascii ../../..
 
	cd ../../

	git clone https://github.com/adriabama06/ascii-player.git

	cd ascii-player

	mkdir build 

	cd build

	cmake .. && cmake --build .

	mv ascii-player ../../..

	cd ../../..

	mkdir frames

	ffmpeg -i video.mp4 -vf scale=48x32 -pix_fmt bgr24 frames/%04d.bmp

	mkdir frames_as_txt

	./image-to-ascii -i frames -o frames_as_txt

	rm -rf temp/ frames/

	read -p "Do you want to play the media? <y/N> " prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	then
 		exec ./play
	else
  		exit 0
	fi

}
else
  exit 0
fi
