<script lang="ts">
	import { writable } from 'svelte/store'
	// import { clickOutside } from '../Behavior/clickOutside'

	let expanded = writable(false)

	const handleExpand = () => {
		$expanded = !$expanded
	}
</script>

<span class="relative">
	<slot {expanded} {handleExpand} />
</span>
