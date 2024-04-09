<script lang="ts">
	import { createToggleControl } from '../Behavior/toggleStore'

	let expandControll = createToggleControl(false)
</script>

<span class="relative">
	<slot {expandControll} />
</span>
