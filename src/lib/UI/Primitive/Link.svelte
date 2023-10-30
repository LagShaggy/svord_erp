<script lang="ts">
	export let path: string
</script>

<a href={path} class="flex justify-center items-center">
	<slot />
</a>
