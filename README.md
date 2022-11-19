# sleepScapes *(sleep sounds)*

# MODELS

## USER
- [x] name:string
- [ ] bio:string
- [x] admin:boolean *(def => false)*
- [ ] profile_picture:image
- [ ] banner_picture:image

## SLEEPSCAPE
- [ ] title:string
- [ ] description:string
- [ ]


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
