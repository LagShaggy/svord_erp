<script lang="ts">
	import FootBar from '$lib/UI/FootBar/FootBar.svelte'
</script>

<div class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
	<div class="h-min py-6 lg:px-8 font-oswald shadow-xl">
		<slot />
	</div>
	<FootBar />
</div>
