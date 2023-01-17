<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">

<h1 align="center">[soundScapes] - Background Noise App</h1>

  <p align="center">
  This app is intended to use for sleeping, studying, or just a distraction. Users can create accounts, post their own <i>soundScapes</i>, follow users, comment, like posts, and more.
    <br />
    <a href="https://linktowebsite.com">View Live Demo</a>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Rails</a>
      <ul>
        <li><a>Models</a></li>
        <li><a>Controller</a></li>
        <li><a>Views</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

For this project I used layers of images then animated, and oriented it with CSS. Using Javascript to add and remove animations as well. Created design with Images, and pure CSS.

<img src="./src/img/ZoltarFirst.gif" alt="a gif of Zoltar with hand moving and lamps flickering" />

I then manipulate the DOM to place a random fortune after Zoltar has spoken wisdom, which is randomized and played using [Howler](howler.link) The random fortunes come from an array and generates a unique set of lucky numbers for each fortune.

<img src="./src/img/ZoltarSecond.gif" alt="Zoltars fortune sliding down the screen and closing it" />

<br/>

### Built With
 - Ruby on Rails
 - SCSS
<br/>
<br/>
<!-- USAGE EXAMPLES -->

## Usage

Open Zoltar when you're facing troubles, open Zoltar when you're curious. Get fortunes *(without the quarters!)*
<br/>
<br/>

<!-- CONTACT -->
## Contact

**John Farina** - johnfarina8@gmail.com

Project Link: [github.com/john-farina/Zoltar](https://github.com/john-farina/sleepScapes)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

# sleepScapes *(sleep sounds)*

categorys

- sleep
- study
- distraction

sleepscapes has many categorys (MAX 3)
category model (belongs_to sleepscape)
category:string (which whill be "sleep", "study", "distraction")

## WHAT I NEED TO FINISH
- X category home pages
- a user generated content page
- all users page with most followed users etc
- emails for when you get follows, comments
- (working on now) edit videos/photos before i save them to databse
- record 8-10 admin soundscapes
- use 6-7 fake ones from free internet content

### MODELS (basic idea brainstorm)
## USER (ontop of clearance)
- [x] name:string
- [ ] bio:string
- [x] admin:boolean *(def => false)*
- [x] profile_picture:image
- [x] banner_picture:image
- [x] has_many *likes*
- [x] has_many *sleepscapes*
- [x] has_many *following*

## SLEEPSCAPE
- [x] title:string
- [x] description:string
- [x] audio:audio? (will loop the audio minimum 1 min long)
- [x] short_video:video? (video will be muted and loop over audio)



## HOW I THINK I WILL SCTRUCTURE THIS

#### -USER MODELS
#### -SLEEPSCAPE *(post)* MODELS
#### -COMMENT MODELS
#### -LIKES MODELS

## RELATIONS TO MODELS

### *USER*
#### - has_many *SLEEPSCAPES*
#### - has_many *LIKES*
#### - has_many *FOLLOWERS & FOLLOWING*

### *SLEEPSCAPES*
#### - has_many *COMMENTS*
#### - has_many *LIKES?* *(think ill be getting these from the user model relations and just counting how many has the post id or something)*
