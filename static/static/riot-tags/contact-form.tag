<contact-form>
    <div id="modal-info" class="modal-info modal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick={ resetForm } type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="infoModalLabel">Golden Retrievers Cleveland: Contact</h4>
                </div><!--//modal-header-->
                <div class="modal-body">
                    <ul if={ errors }>
                        <li each={ error in errors } style='color:red'>{ error.name }: { error.data.message }</li>
                    </ul>
                    <form onsubmit={ submitContactForm }>
                         <div class="form-group">
                            <label for="exampleInputEmail1">Whats your name?</label>
                            <input type="text" class="form-control" placeholder="John Doe" name='inputName'>
                        </div>

                        <div class="form-group">
                            <label for="title">Whats this about?</label>
                            <input type="text" class="form-control" placeholder="This is about..."name='inputTitle'>
                        </div>
                      <label for="textArea">Tell me more</label>
                      <textarea class="form-control" rows="10" name='inputDescription' placeholder='Once upon a time...'></textarea>
                      <button type="submit" class="btn btn-info" style='margin-top: 15px;'>Submit</button>
                    </form>
                </div><!--//modal-body-->
            </div><!--//modal-content-->
        </div>
    </div><!--//modal-->
<script>
    var self = this
    contents = {csrfmiddlewaretoken:opts.csrftoken}

    submitContactForm(){
        name = this.inputName.value
        title = this.inputTitle.value
        description = this.inputDescription.value
        base = location.origin 
        
        form = {
            name: name, 
            title:title,
            description: description
        }

        data = Object.assign(contents,form)

        url = `${base}/api/home/contact/`
        $.post(url,data).then((data) => {
            $('#modal-info').modal('hide')
            scroll(0,0)
            self.resetForm()
            alertify.success(data)
        })
        .fail((e) => {
          res = JSON.parse(e.responseJSON)
          arr = []
          for (var name in res) {
            data = res[name]
            arr.push({name:name,data:data[0]})
          }
          self.errors = arr
          self.update()
        })
    }

    resetForm(){
        this.inputName.value = null
        this.inputTitle.value = null
        this.inputDescription.value = null
    }
</script>

</contact-form>