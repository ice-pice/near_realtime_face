function [n det] = runFacedet(imgpath)

outfile = ['out_dir/' imgpath(1:end-4) '.vj.txt'];

system(sprintf('opencv_files/vj opencv_files/haarcascade_frontalface_alt2.xml opencv_files/haarcascade_profileface.xml %s %s',imgpath,outfile));
% % system(sprintf('/home/ayush/cvit/face-release1.0-basic/violajones/vj /home/ayush/cvit/face-release1.0-basic/violajones/ncvpripg_frontal.xml /home/ayush/cvit/face-release1.0-basic/violajones/ncvpripg_profile.xml %s %s',imgpath,outfile));

path = [outfile '.vj'];
T=dlmread(path);
n=T(1);
n2 = T(n+2,1);
det = zeros(n+n2,4);
det(1:n,:) = T(2:n+1,:);
det(n+1:end,:) = T(n+3:end,:);
n = n+n2;
end