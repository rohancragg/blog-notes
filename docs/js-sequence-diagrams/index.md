# Examples

This is a demo of [this](http://bwmarrin.github.io/MkDocsPlus/js-sequence-diagrams/)

<div id="diagram"></div>


<div class="diagram">
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
</div>


<script src="underscore-min.js"></script>
<script src="raphael-min.js"></script>
<script src="sequence-diagram-min.js"></script>

<script> 
var diagram = Diagram.parse("A->B: Does something");
diagram.drawSVG('diagram');
</script>

<script>
$(".diagram").sequenceDiagram({theme: 'simple'});
</script>