<script>
	import { Group } from 'flowbite-svelte';

	//gets imported when instantiated
	export let item;

	function click() {
		console.log(item);
	}
</script>

<a
	class="rounded-md hover:bg-gray-600"
	on:click={click}
	on:keypress
	href="products/item/{item.id}"
>
	<p class="text-center, text-4xl">
		{item.name}
	</p>
	<p class="text-center">
		Number of items left: {item.quantity}
	</p>
</a>
