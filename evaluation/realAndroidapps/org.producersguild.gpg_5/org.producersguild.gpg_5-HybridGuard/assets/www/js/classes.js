function CurrentPosition() {
    this.lat = 0;
    this.lng = 0;
    this.city = '';
    this.state = '';

    this.getPositionDesc = function() {
        if (this.city != '')
            return this.city;
        else
            return this.state;
    },

    this.setPosition = function(lat, lng) {
        this.lat = lat;
        this.lng = lng;
    }
}

function Article(id, slug, title, content) {
    this.id = id;
    this.slug = slug;
    this.title = title;
    this.content = content;

    this.getOptionElement = function() {
        return $("<option value='"+ this.id +"'>" + this.title + "</option>");
    }
}

function SearchResults() {
    var vendors;

    this.addVendor = function(data) {
        if (this.vendors == undefined)
            this.vendors = new Array();

        this.vendors.push(data)
    };

    this.clearVendors = function() {
        this.vendors = new Array();
    };

    this.getVendorById = function(id) {
        for (var i=0; i < this.vendors.length; i++) {
            if (this.vendors[i].id  == id) {
                return this.vendors[i];
            }
        }
    }
}

function SavedSearch(id, name, keyword, categories, departments) {
    this.id = id;
    this.name = name;
    this.keyword = keyword;
    this.categories = categories;
    this.departments = departments;
}


function StaticMessages() {}
StaticMessages.showMessage = function(txt) {
    return "<div id='message'>" + txt + "</div>";
},

StaticMessages.NO_FAVORITES = 'You have no favorite vendors yet.';


function SpecialScroll() {
    var start_x = 0;
    var start_y = 0;
    var stop_x = 0;
    var stop_y = 0;
    var start_time = 0;
    var stop_time = 0;
    
    this.setStart = function(e) {
        var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
        console.log('touch start: ' + touch.pageY+' '+touch.pageX);
        this.start_x = touch.pageX;
        this.start_y = touch.pageY;
        this.start_time = e.timeStamp;
    }
    
    this.setStop = function(e) {
        var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
        console.log('touch stop: ' + touch.pageY+' '+touch.pageX);
        this.stop_x = touch.pageX;
        this.stop_y = touch.pageY;
        
        this.stop_time = e.timeStamp;
    }
    
    this.isScrollEvent = function() {
        if (this.getEventTime() < 500 && this.getDeltaX() < 0 && Math.abs(this.getDeltaX()) >= 2*Math.abs(this.getDeltaY())) {
            return true;
        }
        
        return false;
    }
            
    this.getEventTime = function() {
        return this.stop_time - this.start_time;
    }
    
    this.getDeltaX = function() {
        return this.stop_x - this.start_x;
    }
    
    this.getDeltaY = function() {
        return this.stop_y - this.start_y;
    }
    
    this.toString = function() {
        return 'start(' + this.start_time + ':'+ this.start_x + 'x'+this.start_y+') '+
        'stop(' + this.stop_time + ':' + this.stop_x + 'x' + this.stop_y+')' +
        'delta(' + this.getEventTime() + ':' + this.getDeltaX() + 'x' + this.getDeltaY() + ')';

    }
}
var specialScroll = new SpecialScroll();
