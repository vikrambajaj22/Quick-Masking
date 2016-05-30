%place this file in the same folder as the images that have to be masked

NumberOfimages = 10;             %enter number of images, for example 10     
prefix_image='image_name';       %enter the image name (without sequence number and file type), for example 'image_name'
fileformat='.jpg';               %enter the file format, for example '.jpg'

for num=1:NumberOfimages
  image = imread(strcat(prefix_image,num2str(num),fileformat));
  figure;
  subplot(1,2,1);
  imshow(image);
  message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
  uiwait(msgbox(message));
  rect = imrect();               %replace imrect() with desired function, such as impoly(), imellipse(), imfreehand(), depending on the type of mask required
  binaryImage = rect.createMask();
  subplot(1,2,2);
  imshow(binaryImage);
  %create new file to store the masked image
  %the path must properly escape the backslashes, i.e. use \\ instead of \
  %the masked images will be saved as image_name1.jpg, image_name2.jpg, ...
  filename = sprintf('<Path to masked images>\\image_name%d.jpg', num);
  imwrite(binaryImage,filename,'jpg');
  close;
end
