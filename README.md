<a name="readme-top"></a>
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![SASS](https://img.shields.io/badge/SASS-hotpink.svg?style=for-the-badge&logo=SASS&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
<br/>

<!-- what did i do in this project
MAIN:
- Created a CRUD app where users can create, read, update, and delete.
- Users can Follow other users, comment on posts, like posts, and creaste posts.
- Users can then edit there own posts or delete there own posts.
- Created home pages with random suggestions for all of the admin chose soundscapes
- Made a admin chosen Soundscape list where i can accept any soundscape for it to get added to the reccomended so there is a quality check for the home page
- created 3 home pages for each category where it will only show the soundscapes that are tagged with the corresponding category
- Users can look at other users page and see what they have posted or who they are following, can also like posts and save there posts on ur profile.
- Using clearance for the base users to secure more authentication and adding more to the clearance model. -->
<!-- DESIGN:
- The home animation was made with CSS having a stack of words move up and down on a div that is masking out everything outside of it. creating the illusuion of a spinning wheel. (also has a random background every time you visit the page.)
- styled it entirely from SCSS and Javascript to add and remove classnames that correspond with an animation.
- Tried to style it clean but unique so it isnt distracting when users are looking for a new sound to listen too.
- Was inspired by a minimalistic website look with alot of background blurring to help with the effect.
- User Home pages where made to fit the websites style even tho users can choose any background image or profile picture. The border fits to the size of the screen and adjusts itself properly.
- Went with a main blue accent color but the color switches if you go to any of the category home pages. -->


<!-- PROJECT LOGO -->
<br />
<div align="center">


<h1 align="center">[soundScapes]</h1>

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
   <li><a href="#structure">Structure</a></li>
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
[soundScapes] is a platform for users to share their favorite sounds for Studying, Sleeping, etc. with the community. Users can create, read, update, and delete Soundscapes, as well as follow other users, comment on posts, like posts, and create posts.

Each user has their own page where they can see the posts they have created, the posts they have liked, and the users they are following. Additionally, there are three category-specific home pages for easier navigation and a home page with random soundscape suggestions selected by an admin.
<br/>

### Built With
 - Ruby on Rails
 - JavaScript
 - HTML
 - SCSS

### Structure
Here are the main folders i used for this project.

- <a href="">`app/controllers/`</a>
- <a href="">`app/javascript/files/`</a>
- <a href="">`app/views/home_pages/`</a>

## Rails

### Controllers
#### **Home Pages**
The Home Pages are all the same with different parameters, the Main homepage is all of the Soundscapes mixed together so all of them, but for studyScapes for example everything on that page needs to have the study tag or else it wont show up. Giving a sence of orginization on the site.

#### **Soundscape**
The Soundscape controller is controlling everything to do with Posting, viewing, deleting soundscapes. Allowing users to Like and comment on posts. And removing those likes or commenst. <br/>
the soundScapes model has_many: comments, and likes. The comments and likes are being produced by join tables which are storing a id to the user that liked it, etc.

#### **Users**

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
