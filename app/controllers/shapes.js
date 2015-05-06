import Ember from 'ember';

export default Ember.ArrayController.extend({
  sortProperties: ['timestamp'],
  sortAscending: false, // sorts post by timestamp

  filter: '',
  filteredContent: function () {
    var filter = this.get('filter');
    var rx = new RegExp(filter, 'gi');
    var shapes = this.get('arrangedContent');

    return shapes.filter(function (shape) {
        return shape.get('type').match(rx);
    });
  }.property('arrangedContent', 'filter', 'content.@each', 'content.@each.type'),
  // ^ content.@each makes sure that this is recomputed on new elements

  actions: {
    saveShape: function() {
      var newShape = this.store.createRecord('shape', {
        title: this.get('title'),
        colour: this.get('colour'),
        type: this.get('type'),
        timestamp: new Date().getTime()
      });
      newShape.save();
    }
  }
});