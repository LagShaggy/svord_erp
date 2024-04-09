<script lang="ts">
	import FootBar from '$lib/UI/FootBar/FootBar.svelte'
	import ActionButtonContainer from '$src/lib/UI/ActionButton/ActionButtonContainer.svelte'
</script>

<div class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
	<div class="h-min py-6 lg:px-8 font-oswald shadow-xl">
		<slot />
	</div>
	<ActionButtonContainer />
	<FootBar />
</div>
