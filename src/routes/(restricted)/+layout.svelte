<script lang="ts">
	import FootBar from '$lib/UI/FootBar/FootBar.svelte'
	import ActionButtonContainer from '$src/lib/UI/ActionButton/ActionButtonContainer.svelte'
	import type { LayoutData } from './$types'

	export let data: LayoutData
	let { profile } = data
	$: ({ profile } = data)
</script>

<div class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
	<div class="h-min py-6 lg:px-8 font-oswald shadow-xl">
		<slot />
	</div>
	<ActionButtonContainer />
	<FootBar />
</div>
