<script>
	import { Group } from 'flowbite-svelte';

	export let itemName = 'Suit';
	export let item = {};

	function click() {
		console.log('You clicked!');
	}
</script>

<div
	class="rounded-md hover:bg-gray-600"
	on:click={click}
	on:keypress
>
	<div class="text-center, text-4xl">
		{item.name}
	</div>
	<div class="text-center">
		Number of items left: {item.quantity}
	</div>
</div>
