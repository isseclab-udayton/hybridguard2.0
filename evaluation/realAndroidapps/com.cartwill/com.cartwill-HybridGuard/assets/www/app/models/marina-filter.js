marina.filter = function() {
  var filter = {};

  filter.nameMatches = function(value, criteria) {
    return value.name.match(new RegExp(criteria, 'gi'));
  };

  filter.descriptionMatches = function(value, criteria) {
    return $(value.description).text().match(new RegExp(criteria, 'gi'));
  };

  filter.byAll = function(values, criteria) {
    var byName = filter.byName(values, criteria);
    var byDesc = filter.byDescription(values, criteria);
    return _.union(byName, byDesc);
  };

  var filterBy = function(matcher, values, criteria) {
    return _(values).filter(function(value) { return matcher(value, criteria); });
  };

  filter.byName = function(values, criteria) {
    return filterBy(filter.nameMatches, values, criteria);
  };

  filter.byDescription = function(values, criteria) {
    return filterBy(filter.descriptionMatches, values, criteria);
  };
  
  if (marina.marinas) {
    marina.marinas.filterBy = function(criteria) {
      return filter.byAll(marina.marinas, criteria);
    };
  } else {
    console.log('No marinas defined, filtering not implemented');
  }

  return filter;

}();
