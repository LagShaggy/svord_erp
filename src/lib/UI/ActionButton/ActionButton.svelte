<script lang="ts">
	export let click: () => void
	export let className: string = ''
</script>

<button
	on:click={click}
	class="flex justify-center items-center bg-base-colour aspect-square h-12 rounded-full {className}"
>
	<slot />
</button>
