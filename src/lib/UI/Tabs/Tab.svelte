<script lang="ts">
	import { getContext, onMount } from 'svelte'
	import type { Readable, Stores, Writable } from 'svelte/store'
	import { TabContext, type IndexDistributor } from './Atoms/tabHelpers'

	const selectedIndex: Writable<number> = getContext(TabContext.SELECTED)
	const indexDistributor: IndexDistributor = getContext(TabContext.INDEX)
	let selected: boolean
	let myIndex: number

	$: selected = $selectedIndex == myIndex

	const selectThis = () => {
		selectedIndex.set(myIndex)
	}

	onMount(() => {
		myIndex = indexDistributor.getIndex()
	})
</script>

<button on:click={selectThis} class={selected ? 'bg-red-500' : 'bg-white'}>
	<p class="pt-3 px-5">
		<slot />
		{myIndex}
	</p>
</button>
