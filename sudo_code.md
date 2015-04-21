
Given a file called 'my_input.markdown' i need to open the
file and read the contents line by line.

If a line begins with a '#' up to a '#####' followed by a space
and then words, those words need to be converted to the 
header of the same size. i.e '# foo' == <h1>foo</h1>
emphasis and strong apply here as well.


if a line does not begin with a header tag '#' to '#####'
then it should be enclosed in <p>paragraph</p> tags

<p>
A paragraph.
</p>

adjacent lines belong to the same paragraph, lines separated by
a space a separate paragraphs

inside of paragraphs can contain the following:

*emphasis*
**strong**

and '&' needs to be converted into its equivalent 'amp;'
