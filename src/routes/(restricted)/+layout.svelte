<script lang="ts">
	import FootBar from '$lib/UI/FootBar/FootBar.svelte'
	import type { ActionData, LayoutData } from './$types'

	export let data: LayoutData
	const { supabase } = data
</script>

<div class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
	<div class="h-min py-6 lg:px-8 pb-16 font-oswald shadow-xl">
		<slot />
	</div>
	<FootBar />
</div>

<style>
</style>
