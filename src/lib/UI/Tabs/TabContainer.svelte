<script lang="ts">
	import { setContext } from 'svelte'
	import { writable, type Writable } from 'svelte/store'
	import { TabContext } from './atoms/tabHelpers'

	export let selectedIndex: Writable<number> = writable(0)
	setContext(TabContext.SELECTED, selectedIndex)
</script>

<slot />
