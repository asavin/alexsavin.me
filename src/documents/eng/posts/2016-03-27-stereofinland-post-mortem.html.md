---
name: StereoFinland dot com - post mortem
date: 2016-03-27T21:57:48+01:00
layout: post.jade
description: StereoFinland was my project on 3D photography and it is time to reflect and archive it. You will also find hints on how to preserve your Wordpress site available while not paying for it pretty much anything.
tags:
- Wordpress
- StereoFinland
- stereoscopic
---

<img src="https://alexsavin.me/photos/2016-03-27-stereofinland/StereoFinland.gif" class="featured" alt="StereoFinland dot com site snapshot">

StereoFinland dot com has been a fun project to do on a spare time. I’ve started it 6 years ago in the early 2010, while still living in the town of Tampere, Finland. That was the year when suddenly all digital cinemas became 3D capable, and things actually started to change. I made my own stereoscopic SLR rig and decided to learn proper 3D photography. Hence, the website. It was suppose to be a source and a platform to learn things, spread news, publish pictures and receive feedback. Little did I knew the trend of the web was already going against web portals, which were super hot thing since like 1998.

StereoFinland contains bunch of stereoscopic pictures and galleries of… Finland. I’ve travelled pretty much all over the country during next 2-3 years and took a _lot_ of 3D pictures. Some of them are hosted on the site itself, most of them however are hosted on Flickr and Phereo. Both of which are still up, which is positive. I’ll provide a list of links in the end of this post. In addition it contains a few tutorials on StereoPhotomaker, sort of outdated tutorial on making your own 3D DCP packages (was super hard task back at a time). And a bunch of nowadays irrelevant news and links.

#### Preserving the Wordpress site without paying too much

Biggest question is what to do with the site. It is a basic Wordpress site, nothing fancy. And we’re living in the age of Docker, EC2 images, clusters and clouds. How hard and expensive can it be to just have it hanging in the AWS? 

In order to host Wordpress you will need EC2 instance, probably a t2.micro. This will cost around $10 / month. You can clone it from one of the available Wordpress images in the AWS Marketplace. This will effectively spawn you a ready to go Wordpress site on your EC2 instance. Then you’d need to ssh into it and apply whatever customisations you had. There is a handy [plugin](https://wordpress.org/plugins/duplicator/) that can do all of the dirty work for you. Depending on the situation, you might have to tweak the config of your Apache.

The new and hot option would be containers. Create a Docker container locally, have local environment on your machine that is equal to the remote, deploy changes with the container. With Wordpress generally it’s been always pain to have _exact_ copy of the remote site on your machine. Docker would take this problem away. In order to do this you’d need to compose your ultimate container from a few basic ones, create a cluster of EC2 machines and deploy container to it. This would be totally awesome, resilient, easily maintainable Wordpress site. It would also be an overkill.

I’ve decided instead rip the site into static html, and host that html on S3 bucket. Consider this an archiving action. Site is still accessible, but no more changes will be done on it. I do have snapshot of the site too just in case, but obviously I’m never going to bring it back to life. Another option would be to just shutdown the whole thing - same way as things usually happen on the Web. Archive.org is trying to literally save the whole internet and preserve it for history precisely because people do amazing things on the Web, and then just take them down. So for now StereoFinland will be still accessible.

#### Notable materials

All stereoscopic galleries and pictures are also freely available on my Flickr and Phereo accounts.

This [stereoscopic Flickr collection](https://www.flickr.com/photos/karismafilms/collections/72157623974825137/) contains 144 albums of pictures from all over the world, mostly in red-cyan anaglyph format. All galleries from StereoFinland can be found there.

<img src="https://alexsavin.me/photos/2016-03-27-stereofinland/collection-stereoplanet.gif" class="featured" alt="Stereo planet collection snapshot">

This [Phereo collection](http://phereo.com/alex) contains most of the same pictures as above, but available for viewing in a bunch of formats (in addition to black and white anaglyph). You can view pictures on 3DTV, Oculus Rift, 3D capable Android device, or pretty much anything else 3D capable.

#### Book

StereoFinland book is still relevant and available in the iTunes Books store (for free). A bunch of stereoscopic pictures from all around finland, carefully selected and packed into a neat digital book. Download and view it on any Apple device nowadays. It used to be iPad only thing in the beginning.

<img src="https://alexsavin.me/photos/2016-03-27-stereofinland/stereofinland-book.jpg" class="featured" alt="Finland in 3D book">

You will need red-cyan 3D glasses for watching.

Direct link to the iBookstore - [Finland in 3D book](http://itunes.apple.com/us/book/finland-in-3d/id513730442?ls=1)

#### What’s next

Probably VR. Looking forward to my Oculus pre-order.
