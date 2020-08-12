@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            
                @if(session('message'))
                    <h3 class="text-center alert alert-success">{{ session('message') }}</h3>
                @endif

                <div class="card pub_image pub_image_detail">
                    <div class="card-header">
                        @if($image->user->image)
                            <div class="container-avatar">
                                <img src="{{ route('user-avatar', ['filename' => $image->user->image]) }}" alt="" class="avatar"/>
                            </div>
                        @endif
                        <div class="data-user">
                            {{ '@'.$image->user->nick }}
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="image-container image-detail">
                            <img src="{{ route('image-file', ['filename' => $image->image_path]) }}" alt=""/>
                        </div>
                        
                        <div class="description">
                            <span class="date">{{ \FormatTime::LongTimeFilter($image->created_at) }}</span>
                            <p>{{ $image->description }}</p>
                        </div>

                        <div class="likes">
                            {{ count($image->likes) }}
                            <?php $user_like = false; ?>
                            @foreach($image->likes as $like)
                                @if($like->user_id == Auth::user()->id)
                                    <?php $user_like = true; ?>
                                @endif
                            @endforeach

                            @if($user_like)
                                <img id="{{$image->id}}" src="{{ asset('img/red-heart.png') }}" alt="" class="btn-dislike"/>
                            @else
                                <img id="{{$image->id}}" src="{{ asset('img/grey-heart.png') }}" alt="" class="btn-like"/>
                            @endif
                        </div>

                        <div class="actions">
                            @if(Auth::user() && $image->user_id == Auth::user()->id)
                                <a href="{{ route('image-config', ['id' => $image->id]) }}" class="btn btn-sm btn-warning">
                                    Actualizar
                                </a>

                                <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal">
                                Eliminar
                                </button>

                                <!-- The Modal -->
                                <div class="modal" id="myModal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Estás seguro?</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            Si eliminas esta imagen nunca podras recuperarla, estás seguro?
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                                            <a href="{{ route('image-delete', ['id' => $image->id]) }}" class="btn btn-danger">
                                                Borrar Definitivamente
                                            </a>
                                        </div>

                                        </div>
                                    </div>  
                                </div>  
                            @endif
                        </div>

                        <div class="clearfix"></div>
                        <div class="comments">
                            
                            <h2>Comentarios ({{ count($image->comments) }})</h2>
                            <hr> 

                            <form method="post" action="{{ route('comment-save') }}">
                                @csrf

                                <input type="hidden" value="{{$image->id}}" name="image_id">
                                <p>
                                    <textarea class="form-control {{ $errors->has('content') ? 'is-invalid' : ''}}" name="content"></textarea>
                                    @if($errors->has('content'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>Debes añadir contenido a tu comentario para poder enviarlo</strong>
                                        </span>
                                    @endif
                                </p>

                                <button type="submit" class="m-t-20 btn btn-success">Enviar</button>
                            </form>
                            
                            <hr>

                            @foreach($image->comments as $comment)
                                <div class="comment">
                                    <span class="nickname">{{'@'.$comment->user->nick.' | '}}</span>
                                    <span class="date">{{ \FormatTime::LongTimeFilter($comment->created_at) }}</span>
                                    <p>
                                        {{ $comment->content }}
                                        <br>
                                        @if(Auth::check() && ($comment->user_id == Auth::user()->id || $comment->image->user_id == Auth::user()->id))
                                        <a href="{{ route('comment-delete', ['id' => $comment->id]) }}" class="btn btn-sm btn-danger">
                                            Eliminar
                                        </a>
                                    </p>
                                    @endif
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>
            
        </div>
    </div>
</div>
@endsection