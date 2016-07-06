<track-list>
	<h3>tracklist:</h3>
	<ul style='list-style-type:none;'>
		<li each={ track in tracks }>
			<div class="col-md-4">
			<a href="" onclick={ showTrack }><img src="{ track.artwork_url }"></a>
			<p>
				<a href="{ track.permalink_url }">{ track.title }</a>
				<br>
				time: { toMinutes(track.duration) }
				genre: { track.genre }
				comment count: { track.comment_count }
				plays: { track.playback_count }
				heart: { track.favoritings_count }
			</p>
			</div>
		</li>
	</ul>
<script>
	self = this
	this.on('mount',function(){
		if (self.opts.tracks) {
			self.tracks = self.opts.tracks
			self.update()
		}
	})

	toMinutes(milliseconds){
		return ((milliseconds*.001) / 60).toFixed(2)
	}

	showTrack(e){
		track = e.item.track
		opts.bus.trigger('updateTrack',track)
	}
</script>

</track-list>