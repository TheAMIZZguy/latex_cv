# Latex CV
- This CV is inspired by the design of [Awesome CV](https://github.com/posquit0/Awesome-CV).
- Original LaTeX template from Murat Can Karacabey can be found in [Overleaf](https://www.overleaf.com/latex/templates/murats-cv-template/gfwjwshrzqgd). 
- Modified by myself to make it much more modular for quick editing, but maintaining all the core aspects of it, Overleaf template is soon to be completed, alongside some anonymization for myself, uploading it early for a friend

### How does it look?

<img src="https://github.com/muratcankaracabey/latex_cv/blob/master/images/example_cv.png" width="425"/> <img src="https://github.com/muratcankaracabey/latex_cv/blob/master/images/coverletter.png" width="425"/> 
<img src="https://github.com/TheAMIZZguy/latex_cv/blob/master/images/CV_Sample_Me.pdf" width="425"/> <img src="https://github.com/TheAMIZZguy/latex_cv/blob/master/images/CovLet_Sample_Me.pdf" width="425"/>

### How to use it?
- The strength lies with the ```\createexperienceblock``` and ```\showexperienceblock``` commands to add elements to your CV. You can use the original commands with commands like ```\datedexperience``` as seen in the original file. 
- Coverletter functionality is WIP but nearly done
- Of course, if you want to go further you can check the original [muratcan_cv.cls](https://github.com/muratcankaracabey/latex_cv/blob/master/muratcan_cv.cls) file or wait until I also upload mine. This is both of our first larger LaTeX projects, so bare with some errors.
- You can change the header content with the ```set..``` commands in the beginning and also the the color of the theme.
- Just replace the actual texts with your related education/experience and also don't forget to replace ```\lipsum[1][1-12]\par``` with actual texts. That package is just used for illustration reasons. Since I am not sure what to write to those parts of the resume right now.

## Why use it? or this version
This is a place to keep all the varied experiences and general information that you may want to include in a resume/cv/etc. 

Rather than trying to remeber everything you did at a job, or recall old information from an old project, being able to keep it all in the same place but display only what you want allows you to quickly modularize your files to tailor for any role that you want to apply to. And keeping this open on the side during an interview can help you recall information that is not even on your resume!

## Core Files
- res_format.cls is the one that contains the formatting and stylizing of the resume. Complete with all the commands
- personal_information.tex is where you would put the information about you, used for resumes, cv, coverletter, etc. effectively this is near-invariant contact info.
- experience.tex this is where you would write all your work/project/competition/etc experience. Pretty much everything that you actually want to showcase in a resume. Written in a way such that you would write as many bulletpoints of information (and even repeat them with different wordings/length). This makes it so you can always have a full set of information for each experience (in one place), but then only select the bulletpoints you want to make a quick resume tailored to any job
- res_jun2024 is the example of how you would actually use the information from the previously mentioned two files
- cl_format.cls, coverletter_paragraphs, and cl_jun2024 is a current work-in-progress to also do the same at the paragraph level with

## Other
- There is a way to include a profile picture in the resume if that is what you want, which is why the images folder exists
- I recommend adding a folder to hold older versions of the files that you make
- Some light experience in LaTeX is recommended, but not required. Anyone that is downloading something off GitHub should have enough experience to understand the general formatting and use trial-and error
- Useful commands:
-- \emph{text} for italics and \bfseries{text} for bold
-- \cps for the red | with a lot of spacing \cpshalf for less spacing between letters
- Everything to modify, from colour to the header-style is in res_format. main subtitles are separating using double percentages
   
### TODOS

- [ ] Coverletter automater.
- [ ] Anonymized templates in Overleaf rather than just GitHub.

### Warning
- For Mac users, If you use TexShop, you need to locate the AwesomeFont in your file system and load to your system. It is most probably under ```/usr/local/texlive/2019/texmf-dist/fonts/opentype/public```. Just locate it and double-click install. Then you are good to go.
