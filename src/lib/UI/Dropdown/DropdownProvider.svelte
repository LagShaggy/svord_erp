<script lang="ts">
	import { writable } from 'svelte/store'
	import { createExpandedControl } from '../Behavior/expandStore'
	// import { clickOutside } from '../Behavior/clickOutside'

	let expanded = createExpandedControl(false)
</script>

<span class="relative">
	<slot {expanded} handleExpand={expanded.toggle} />
</span>
