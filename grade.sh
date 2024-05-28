CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

# step 1
git clone $1 student-submission
echo 'Finished cloning'

#step 2
if [[ -f student-submission/ListExamples.java ]]
then
    echo "File was submitted"
else
    echo "File was not submitted"
    exit
fi

# step 3
# cp (files to copy) (directory to copy)
cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area # -r recursively copies files from a directory into another given directory.
echo "Files copied into grading-area"

# step 4
cd grading-area
javac -cp $CPATH *.java
if [[ $? -ne 0 ]]; then
    echo "java files had issues compiling"
else
    echo "java files compiled"
fi

# step 5
java -cp .:"$CPATH" org.junit.runner.JUnitCore TestListExamples


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
