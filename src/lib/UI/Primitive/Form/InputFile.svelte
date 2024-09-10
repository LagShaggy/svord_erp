<script lang="ts">
	export let name: string = 'file'
</script>

<label class="flex justify-center gap-3 cursor-pointer text-center" for="file_upload">
	<slot></slot></label
>
<input type="file" {name} class="hidden" id="file_upload" />
<!-- <Input type="file" {name} {...$$props} className="border-none bg-inherit rounded-none">
	<slot />
</Input> -->
