<script lang="ts">
	import type { Action } from 'svelte/action'
	import { createToggleControl } from '../Behavior/toggleStore'

	export let initial = false
	let expandControll = createToggleControl(initial)

	interface Attributes {
		'on:actionInvoked'?: (event: CustomEvent) => void
	}
</script>

<span class="relative">
	<slot {expandControll} />
</span>
