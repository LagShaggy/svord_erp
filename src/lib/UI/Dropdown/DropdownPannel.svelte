<script>
	import { slide } from 'svelte/transition'
</script>

<div in:slide out:slide class="bg-white w-28 absolute top-10 right-10">
	<slot />
</div>
