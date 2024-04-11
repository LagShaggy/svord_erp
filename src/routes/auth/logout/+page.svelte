<script>
	import ClickableStyling from '$src/lib/UI/Styling/ClickableStyling.svelte'
</script>

<div class="flex flex-col mx-auto items-center">
	<h1 class="text-center">You've been logged out!</h1>
	<a href="/auth/login">
		<ClickableStyling>
			<span> Go to Login </span>
		</ClickableStyling>
	</a>
</div>
