# PDF TORK Logo Version

You can download PDF with TORK-Logo from
https://circle-artifacts.com/gh/tork-a/cheatsheet/8/artifacts/0/home/ubuntu/cheatsheet/ROScheatsheet_catkin.pdf

```
git clone http://gihtub.com/ros/cheatsheet
git remote add -p tork-a
git fetch --all
git checkou master
git cherry-pick b3c0aa6 7adc382
git push -f tork-a master
```

Go To https://circleci.com/gh/tork-a/cheatsheet/tree/master


# ROS Cheatsheet
This is the source of the ROS Cheatsheet.

To download the pdfs see the [releases page](https://github.com/ros/cheatsheet/releases)

## Making your own copy/variation

### Requirements

Building this document requires installing pdflatex

On ubuntu you can get that with this command:
```
sudo apt-get install texlive-latex-base texlive-font-utils
```

### Make your changes

Edit ROScheatsheet.tex

### Build the outputs

To build the pdfs just type `make`


