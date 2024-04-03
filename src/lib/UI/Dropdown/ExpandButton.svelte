<script lang="ts">
	export let expandControll: () => void
	export let className = ''
</script>

<button on:click={expandControll} class="flex justify-center items-center {className}">
	<slot />
</button>
