<script>
	import { Group } from 'flowbite-svelte';

	//gets imported when instantiated
	export let item;

	function click() {
		//something
	}
</script>

<a
	class="rounded-md border-2 border-gray-600 p-2 hover:bg-gray-600"
	on:click={click}
	on:keypress
	href="products/item/{item.id}"
>
	<p class="text-center, text-2xl">
		{item.name}
	</p>
	<p class="text-center">
		Number of items left: {item.quantity}
	</p>
</a>
