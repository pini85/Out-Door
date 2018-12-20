
1. Install node js
Now we use npm which is a front-end package manager from node js.
2. Before install your first package you need to create package.json file. Which basically will contain the definitions
of our project and where NMP will write the packages that we use.
In the command line write "npm init" which will help you create that json file for you.

3. Install node-sass from the command line "npm install node-sass --save-dev"
save-dev means that this package is one of our developer dependencies.It means basically that Node SASS is a tool
that we use to develop our project.

(If for example we wanted to install jquery into this project we can just say npm install jquery And now in this case we're
not going to put a save dev option in here because J query is not a tool for development. It's a JavaScript file that we want
to include in the project.
So we write npm install jquery --save. This will create a dependency. So which means we need this to create the project. We need the jquery
functions that it gives us in order to create the project. DevDependencies is just a tool that will help us in the project. We actually
don't need it. Dependencies means we need this in order that our porject functions.)

(We installed the node-sass and it created the package-lock.json which has a lot of other modules(packages) which node-sass needs.)
(We created the package.json file with dependencies and devdependecies because if for example you want to share your code with somebody,
you do not need to share the huge package-lock.json file(It is called node_modules in some IDE) we just need to share the package.json
file and the other person can recreate the node_modules file. So all you need to do in the command line is "npm install" and it recreates
the node_module file)

(To install live-server we simply write "sudo npm install live-server -g". We use g for it to be global and you can run it without npm run
.You can simply write live-server.)



Every front-end devloper has a customized  build process. It's basically just a sequence of tasks that we perform automatically after
we finish developing a product or a certain feature of a product. And the result of the build process are one or more final files, which
are then ready for production. Which means basically, ready to be deployed to a web server.


1.Complilation(sass)

2.Concatenation(multiple css files into one)

3. Compressing(Making it smaller. Frameworks do this for you already)

a)
"compile:sass": "node-sass sass/main.scss css/style.comp.css"
(We want one for watching and another for the final build process)

b)
"concat:css": "concat -o css/style.concat.css css/icon-font.css css/style.comp.css"
-o stands for output. So we want to create a new css file that contains both icon-font.css and style.comp.css.
To install a concatentation. Simply write in the command line npm install concat --save-dev.
(But in this project I didn't add it because we don't have multiple css files.)


"prefix:css": "postcss --use autoprefixer -b 'last 5 versions' css/style.comp.css -o css/style.prefix.css"
We are using the postcss to use the package autoprefixer -b means browser. Recommended to use 5 last versions for young companies 10 versions for really corporate companies. More version will bloat and slow down performance. It uses the caniuse.com. And then we say what css file do we want to prefix and we make a new file containing the prefixes.
In this project if we actually used concatenation then the script would be like this:
 "prefix:css": "postcss --use autoprefixer -b 'last 10 versions' css/style.concat.css -o css/style.prefix.css"
To install the prefixer we write "npm install autoprefixer --save-dev".
But in order for the autoprefixer to work we need to install postcss. "npm install postcss-cli --save-dev".
Cli means command line interface.
We need postcss because autoprefixer is actually a plugin(or package) of postcss

c)
 "compress:css": "node-sass css/style.prefix.css css/style.css --output-style compressed"
 We do not need to install a new package because node sass can do this job.
 We need an option which is --output-style compressed.
 It will override our style.css that we used in devlopment to put our sass in. But we can reoveride it again. We compress when the final version is finished.

Now we don't want to write all these tasks manually. We want one keyword in the command line to perform all these tasks:

We first need to install a npm package:
npm install npm-run-all.
script:
"build:css": "npm-run-all compile:sass prefix:css compress:css"
We are saying run all these in a squence.

We can combine the live server and the sass -w together. Because we always had to use a separate terminal page for them.
"start": "npm-run-all --parallel devserver watch:sass".
Start is a very common name for devlopers to start the devloper enviroment. We need to use a 2nd argument --parallel because we want them to operate at the same time. Above we wanted a sequence.
