<script lang="ts">
	export let command: () => void
	export let img: string | null
	export let className: string = ''
</script>

<button
	on:click={command}
	class="flex justify-center items-center bg-primary-colour aspect-square h-12 rounded-full {className}"
>
	<img src={img} alt="" />
</button>
