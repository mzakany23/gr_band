<playlist-tracks>
	<style type="text/css">
		.max-scrolling {
			max-height: 500px;
			overflow: scroll;
		}
	</style>

	

	<div class="sc-block center-block max-scrolling">
	<div each={ track in opts.tracks }class="item">
        	<soundplayer track={ track } />
    	</div><!--//item-->
	</div><!--//sc-block-->
	
<script>
	var self = this
	this.count = 0

	this.on('mount',function(){
		if (opts.tracks) {
			self.trackLength = opts.tracks.length
		}
	})

	addLoaded(){
		self.count += 1 
		if (self.count === self.trackLength) {
			
		}
	}
</script>

</playlist-tracks>