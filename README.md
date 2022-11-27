# sleepScapes *(sleep sounds)*

# MODELS (basic idea brainstorm)
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
