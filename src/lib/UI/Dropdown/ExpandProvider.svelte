<script lang="ts">
	import { createExpandedControl } from '../Behavior/expandStore'

	let expandControll = createExpandedControl(false)
</script>

<span class="relative">
	<slot {expandControll} />
</span>
