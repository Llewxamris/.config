# Llewxamris' Configuration
A computer you do not enjoy using is not a good computer. If that computer is
too slow, if the attached screen is too small, if the keyboard is not
comfortable, then that computer has failed at being a useful tool. Software, as
an extension of the computer, falls under this same rule. Fortunately, changing
software to fit your needs is much cheaper than changing your hardware. Free &
open source software in particular has built a culture of allowing end-users to
endlessly customize their software to their liking (to the benefit of
usability, and to the detriment of all the time I've spent on tweaking editors
instead of working on the rest of the projects I have on my list). Both in the
ability to modify the source-code of the application itself, but also in
exposing non-source-code oriented ways. Non-technical individuals (or those who
are, but simply lack the time/knowledge to tweak) are not bared from building
their perfect system.

That said, there is nothing wrong with being content with what is provided to
you out-of-the-box. There's a reason _defaults_ are called _defaults_. If you
find those defaults: visually pleasing, ergonomically pleasing, and let you take
full advantage of your system, why spend the time tweaking?

This repository contains my ever evolving configuration files. Built on,
inspired by, and stolen from the backs of giants. I hope to one day reach the
point where I have crafted my perfect system. Probably sometime in the far
future, when our machines will be interlocked with our minds, scanning our very
souls to determine the best font & colour combination for the day. Until such a
time, I guess I'll continue to waste my lunch breaks thinking about hexadecimal
colour codes.

I try to strive for some consistency in how the software on my system looks and
operates. Keeping a primary font throughout, similar colour themes, and similar
key binds for similar operations (if possible). My current font choice is
[Iosveka Term SS04][1]. I appreciate the slender characters compared to other
fonts, and the ability to use [ligatures][2] is nice even if I don't use them
much (mostly because the support in Emacs is awful). I am currently basing my
colours off of the [Leuven theme][0] for Emacs. I switch back and forth between
dark and light schemes, but at this moment I've settled on light schemes. I keep
the brightness of my screens relatively low (~40% depending on the other light
sources around me), so dark themes tend to result in a really low contrast
ratio that can become uncomfortable after extended use.

I try to keep my system organized and compliant with freedesktop.org's
[Base Directory Specification][3]. That is: configuration files within
`$HOME/.config`, binaries/executable scripts within `$HOME/.local/bin`, and
other application data within `$HOME/.local/shared`.

All of my fundamental configuration files are written in [Org][4]. I use
Org-mode almost exclusively for my organizational and productivity tasks, both
in my personal life and at work. I find it's outline focused structure and
syntax make it  the most comfortable plain-text format for me to write in.

Please don't look at the file type of this `README`.

I wrap all of my configuration around Org files, as it lets me both organize the
configurations in a way I find comfortable, but also opens up more advanced text
formatting that is not available when using comments.

# Installation
The `setup.sh` script handles setting up the configuration files on my machines.
The script checks if you have Emacs available on the `PATH`, but assumes that
Org-mode is already installed and configured. It untangles the Org files into
just the configuration sources, then symbolically links them to the appropriate
locations.

# License
All files, scripts, prose, and the concept of the English language included in this
repository are free for all to use. See `UNLICENSE` for more information.

[0]:https://github.com/fniessen/emacs-leuven-theme
[1]:https://typeof.net/Iosevka/
[2]:https://www.hanselman.com/blog/MonospacedProgrammingFontsWithLigatures.aspx
[3]:https://specifications.freedesktop.org/basedir-spec/latest
[4]:https://orgmode.org
