<script lang="ts">
	export let command = () => {}
</script>

<button class="button button flex justify-center items-center" on:click={command}>
	<slot />
</button>
