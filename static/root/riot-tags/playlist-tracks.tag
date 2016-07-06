<playlist-tracks>
	<style type="text/css">
		.max-scrolling {
			height: 400px;
			overflow: scroll;
		}
	</style>

	<div class="sc-block center-block max-scrolling">
      <div each={ track in opts.tracks }class="item">
          <soundplayer track={ track } />
      </div><!--//item-->
  </div><!--//sc-block-->
<script>
	this.on('mount',function(){
	
	})

	self.soundPlayerConfig = {
		auto_play: false
	}

</script>

</playlist-tracks>