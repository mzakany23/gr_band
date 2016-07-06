<soundplayer>
	<iframe onload={ loaded } width="100%" height="100" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/{ opts.track.id }&amp;color=0E0E10&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe>
	<script>

		loaded(){
			this.parent.addLoaded()
		}
	</script>
</soundplayer>