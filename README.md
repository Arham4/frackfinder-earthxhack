![](https://i.imgur.com/kOmaepN.png)

<div align="center"><i>Using drones to find environmentally efficient fracking sites</i></div>

## Inspiration
We were inspired to pursue this project after talking to Oxy about carbon emissions caused by fracking. They told us about how their biggest carbon footprint comes from fracking. We feel that this is an area that can use a lot of improvement through technology, ultimately for the benefit of the environment since fracking in the right locations for optimal efficiency is critical. Additionally, runoff from fracking operations can pollute rivers and ultimately go into oceans, which is another factor we considered critical for determining the location of potential fracking sites.

## What it does
We made a mobile app that allows oil/natural gas companies to deploy drones over their land to look for the most environmentally optimal fracking site. The app receives livestreams from each registered drone. The drones keep track of potential fracking sites after scoring them using machine learning, and all the potential sites are sorted and then aggregated for the user to see in the application.

## How we built it
The Google Flutter SDK was used with the DJI native platform library using method channels to communicate information from simple UI actions to sending entire native Android views. Keras was used for the Machine Learning.

## Challenges we ran into
The DJI API was not easy to use. We had a really hard time getting the live-streaming to work, and there was not much work done on this before so it was difficult to find relevant forum responses online. However, we experimented with different aspects of Flutter to make it eventually work (and it was pretty elegant too!).

## Accomplishments that we're proud of
Getting the live-stream to work and implementing a machine learning model for scoring fracking sites. Building an all-around beautiful app that can positively impact our beautiful planet.

## What we learned
Drones are amazingly powerful pieces of technology that need to be applied in so many more aspects of our lives!

## What's next for FrackFinder
The biggest next step for FrackFinder is to incorporate real industry data into the product. Currently, the dataset was curated by the creators (us!) and was thus not professionally validated. With a company dataset, we will have an even more robust model. We also want to make the drones autonomous. One other cool thing we want to do is integrate Virtual Reality into our project so the user can watch the drone live-stream through a VR headset.

![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/978/datas/gallery.jpg)
![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/971/datas/gallery.jpg)
![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/961/datas/gallery.jpg)
![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/962/datas/gallery.jpg)
![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/959/datas/gallery.jpg)
![](https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_photos/000/803/957/datas/gallery.jpg)
