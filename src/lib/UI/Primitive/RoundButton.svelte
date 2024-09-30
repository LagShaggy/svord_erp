<script lang="ts">
	export let command: () => void = () => {}
	export let className: String = ''
</script>

<button
	on:click|preventDefault={command}
	class="flex justify-center items-center bg-primary-500 aspect-square h-12 rounded-full {className} shadow-lg overflow-hidden"
>
	<slot></slot>
</button>
