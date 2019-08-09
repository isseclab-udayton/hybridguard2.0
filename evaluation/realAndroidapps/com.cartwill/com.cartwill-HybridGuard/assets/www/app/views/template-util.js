marina.template = function() {
	var template = {};

	template.build = function(selector, locals, raw) {
		var template = $(selector).html();
		// console.log('template: ' + template);
		var fn = jade.compile(template);
		var html = fn(locals);
		// console.log('html: ' + html);
    if (raw)
      return html;
		return $(html);
	};

	return template;
} ();

