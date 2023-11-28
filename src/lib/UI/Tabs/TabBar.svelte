<script lang="ts">
	import { derived, writable } from 'svelte/store'
	import Tab from './Tab.svelte'
	import { onDestroy, setContext } from 'svelte'
	import { TabContext, getIndexDistributor } from './Atoms/tabHelpers'

	const distributor = getIndexDistributor()
	setContext(TabContext.INDEX, distributor)

	onDestroy(() => {
		distributor.destroy()
	})
</script>

<div class="flex flex-row between border-b-2">
	<slot />
</div>
